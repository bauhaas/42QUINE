
RED="\e[91m"
GREEN="\e[92m"
RESET="\e[0m"

#clang over gcc due to -fPIE
CC = clang -Wall -Wextra -Werror
SULLY = Sully.s
GRACE = Grace.s
COLLEEN = Colleen.s

C_OBJS = $(COLLEEN:.s=.o)
G_OBJS = $(GRACE:.s=.o)
S_OBJS = $(SULLY:.s=.o)

%.o: %.s
	nasm -f elf64 -o $*.o $*.s

all: colleen grace sully

colleen: $(C_OBJS)
		@$(CC) $(C_OBJS) -o colleen

grace: $(G_OBJS)
		@$(CC) $(G_OBJS) -o grace

sully: $(S_OBJS)
		@$(CC) $(S_OBJS) -o sully

clean:
			@echo "Deleted all generated files"
			@rm Sully_* Grace_kid.s colleen.log *.o a.out > /dev/null 2>&1

re		:	clean all

.PHONY:		all test colleen grace sully clean re