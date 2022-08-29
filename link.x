SECTIONS {
    .model 0x04010000 : AT(0) {
        *(.data*);
        *(.rodata*);
    }

    /DISCARD/ : {
        *(*);
    }
}