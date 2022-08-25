

// magic macros and header inclusion
#define UNUSED __attribute__((unused))
#define ALIGNED8 __attribute__((aligned(8)))
#define GLUE(a, b) a##b
#define GLUE2(a, b) GLUE(a, b)
#define STR(x) #x
#define STR2(x) STR(x)

#define __model(hd) hd/model.inc.c
#define __geo(hd) hd/geo.inc.c

#define MODEL_FILE STR2(__model(MODELNAME))
#define GEO_FILE STR2(__geo(MODELNAME))

#include <PR/mbi.h>
#include <PR/gbi.h>
#include <geo_commands.h>
typedef u8 Texture;

#include MODEL_FILE
#include GEO_FILE

