
SRCS = $(wildcard *.c ./lib/*.c)    #wildcard把 指定目录 ./ 和 ./lib 下的所有后缀是c的文件全部展开。

OBJS = $(SRCS:.c = .o)    #OBJS将$(SRCS)下的.c文件转化为.o文件

CC = gcc

INCLUDES =	-I	./include

LIBS = -L ./lib

CCFLAGS = -g -Wall -O0   #附加参数

OUTPUT = mkbootimg

all:$(OUTPUT) 

$(OUTPUT) : $(OBJS)
	$(CC) $^ -o $@ $(INCLUDES) $(LIBS)

%.o : %.c
	$(CC) -c $< $(CCFLAGS)

clean:
	rm -rf *.out *.o $(OUTPUT)

.PHONY:clean
