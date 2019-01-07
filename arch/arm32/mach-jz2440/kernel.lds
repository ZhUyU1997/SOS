OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

SECTIONS { 
	. = 0x30100000;
    .text :
	{
		PROVIDE(_text = .);
		arch/arm32/mach-jz2440/head.o;
		arch/arm32/mach-jz2440/init.o;
		arch/arm32/mach-jz2440/nand_ll.o;
		*(.text*);
		PROVIDE(_etext = .);
	}

    .data ALIGN(8) :
	{
		PROVIDE(_data = .);
		*(.data);
		PROVIDE(_edata = .);
	}
	
    .rodata ALIGN(8) :
	{
		PROVIDE(_rodata = .);
		*(.rodata);
		PROVIDE(_erodata = .);
	}

	.bss ALIGN(8) (NOLOAD) :
	{
		PROVIDE(_bss = .);
		*(.bss);
		*(COMMON);
		PROVIDE(_ebss = .);
	}
	
	_end = .;
} 
