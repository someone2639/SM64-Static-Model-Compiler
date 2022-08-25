default: all

#############################
# Change These ##############
MODELNAME=wooden_signpost
#############################


BUILD=build
DEFINES := -DMODELNAME=$(MODELNAME) -D_LANGUAGE_C -D_FINALROM -DF3DEX_GBI_2 -DNON_MATCHING=1


TEXTUREFILES := $(wildcard $(MODELNAME)/*.png)
TEXTURE_OBJS := $(foreach texture, $(TEXTUREFILES), $(texture:.png=.inc.c))


all: model.o

%.inc.c: %.png
	./n64graphics -s u8 -i $@ -g $< -f $(lastword ,$(subst ., ,$(basename $<)))

intermediate.o: Model.c $(TEXTURE_OBJS) $(MODELNAME)/model.inc.c $(MODELNAME)/geo.inc.c
	sed -i "s|actors/$(MODELNAME)|$(MODELNAME)|g" $(MODELNAME)/model.inc.c
	cc -c $< -o $@ -I . -I include/ $(DEFINES)

model.o: intermediate.o
	ld -T link.x -o $@ $<
	echo "            addr                       |offset          |symbol name" > map
	objdump -t $@ | tail -n +6 >> map

clean:
	rm -f -r model.o intermediate.o
