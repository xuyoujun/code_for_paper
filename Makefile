CC = mipseb-linux-gcc
#F77 = gfortran
LD = mipseb-linux-gcc
BENCHDIR=/home/sesc/Desktop
#CFLAGS := -g -O2  -march=armv5 -mfp=vfp3

CFL :=  -mips2 -mabi=32 -static -Wa,-non_shared -mno-abicalls
LDF:= -static -Wl,--script=/home/sesc/sescutils/src/mint.x
CFLAGS :=  -mips2 -mabi=32 -static -Wa,-non_shared -mno-abicalls  -I /home/sesc/sesc/src/libapp/
LDFLAGS:= -static -Wl,--script=/home/sesc/sescutils/src/mint.x\
#									$(BENCHDIR)/automotive/basicmath/*.o\
#									$(BENCHDIR)/automotive/bitcount/*.o\
#									$(BENCHDIR)/consumer/jpeg/jpeg-6a/*.o\
#									$(BENCHDIR)/network/dijkstra/*.o\
#									$(BENCHDIR)/network/patricia/*.o\
#									$(BENCHDIR)/telecomm/adpcm/src/*.o\
#									$(BENCHDIR)/telecomm/CRC32/*.o\
#									$(BENCHDIR)/telecomm/FFT/*.o\
#									$(BENCHDIR)/office/stringsearch/*.o\
#									$(BENCHDIR)/security/sha/*.o\
									-L/home/sesc/sesc-build-test2/obj/mipseb_obj/
#									$(BENCHDIR)/CFP2000/173.applu/src/*.o\
#									$(BENCHDIR)/CFP2000/177.mesa/src/*.o\
#									$(BENCHDIR)/CFP2000/179.art/src/*.o\
#									$(BENCHDIR)/CFP2000/183.equake/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/400.perlbench/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/401.bzip2/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/403.gcc/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/410.bwaves/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/433.milc/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/437.leslie3d/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/444.namd/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/450.soplex/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/453.povray/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/462.libquantum/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/473.astar/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/482.sphinx3/src/*.o\
#									$(BENCH06DIR)/benchspec/CPU2006/447.dealII/src/*.o\
#									$(PARSECDIR)/pkgs/apps/blackscholes/obj/arm-linux.armelrate/*.o\
#									$(PARSECDIR)/pkgs/apps/fluidanimate/obj/arm-linux.armelrate/*.o\
#									$(PARSECDIR)/pkgs/apps/swaptions/obj/arm-linux.armelrate/*.o\
#									$(PARSECDIR)/pkgs/apps/x264/obj/arm-linux.armelrate/*.o\
#									$(PARSECDIR)/pkgs/apps/x264/obj/arm-linux.armelrate/*/*.o\
#									$(PARSECDIR)/pkgs/apps/bodytrack/obj/arm-linux.armelrate/*/*.o\
#									$(PARSECDIR)/pkgs/apps/bodytrack/obj/arm-linux.armelrate/*/*/*.o\
#									$(PARSECDIR)/pkgs/apps/facesim/obj/arm-linux.armelrate/*/*/*/*.o\
#									$(PARSECDIR)/pkgs/apps/facesim/obj/arm-linux.armelrate/TaskQ/lib/*.o\
#									$(PARSECDIR)/pkgs/apps/ferret/obj/arm-linux.armelrate/parsec/lib/*.a\
#									$(PARSECDIR)/pkgs/apps/ferret/obj/arm-linux.armelrate/parsec/obj/*.o\
#									$(PARSECDIR)/pkgs/libs/imagick/inst/arm-linux.armelrate/lib/*.a\
#									$(PARSECDIR)/pkgs/libs/ssl/inst/arm-linux.armelrate/lib/*.a\
#									$(PARSECDIR)/pkgs/libs/zlib/inst/arm-linux.armelrate/lib/*.a\
#									$(PARSECDIR)/pkgs/kernels/canneal/obj/arm-linux.armelrate/*.o\
#									$(SPLASH2DIR)/codes/apps/ocean/non_contiguous_partitions/*.o\
#									$(SPLASH2DIR)/codes/kernels/lu/non_contiguous_blocks/*.o\
#									$(SPLASH2DIR)/codes/kernels/fft/*.o\
#									$(SPLASH2DIR)/codes/kernels/radix/*.o\
#									$(SPLASH2DIR)/codes/apps/fmm/*.o\
#									-L/home/sesc/sesc-build-test2/obj/mipseb_obj
#LIBS   := -lrt  -lm  -lpthread  
app = combina_1
LIBS   := -lm -lapp 
TARGET1 = km_overhead
TARGET2 = km_overhead_overhead

all: $(TARGET1) $(TARGET2) 

$(TARGET1):$(TARGET1).c
	$(CC) -O2 -c $< $(CFLAGS)
	$(CC)  $(LDFLAGS) $(TARGET1).o -o $@

$(TARGET2):$(TARGET2).c
	$(CC) -O2 -c $< $(CFLAGS)
	$(CC)  $(LDFLAGS) $(TARGET2).o -o $@

clean:
	rm $(TARGET1) $(TARGET2)  *.o
