SECTIONS {
    .model : AT(0) {
        *(.data*);
        *(.rodata*);
    }

    /DISCARD/ : {
        *(*);
    }
}