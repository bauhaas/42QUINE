RED="\e[91m"
GREEN="\e[92m"
RESET="\e[0m"

CC = gcc -Wextra -Werror -Wall
SULLY = Sully.c
GRACE = Grace.c
COLLEEN = Colleen.c

C_OBJS		= $(COLLEEN:.c=.o)
G_OBJS		= $(GRACE:.c=.o)
S_OBJS		= $(SULLY:.c=.o)

all: colleen grace sully

test:		$(C_OBJS) $(G_OBJS) $(S_OBJS)
			@echo "--- TESTING ---\n"
			@echo "COLLEEN"
			@$(CC) $(C_OBJS)
			@./a.out > colleen.log
			@if (diff colleen.log Colleen.c); then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi
			@echo "GRACE"
			@$(CC) $(G_OBJS)
			@./a.out
			@if (diff Grace.c Grace_kid.c); then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi
			@echo "SULLY"
			@$(CC) $(S_OBJS)
			@./a.out
			@if test -f "Sully_0.c" && test -f "Sully_1.c" && test -f "Sully_2.c" && test -f "Sully_3.c" && test -f "Sully_4.c"; then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi

colleen: 	$(C_OBJS)
			@$(CC) $(C_OBJS)
			@./a.out

grace: 		$(G_OBJS)
			@$(CC) $(G_OBJS)
			@./a.out

sully: 		$(S_OBJS)
			@$(CC) $(S_OBJS)
			@./a.out

clean:
			@echo "Deleted all generated files"
			@rm *.o > /dev/null 2>&1
			@rm a.out > /dev/null 2>&1
			@rm Sully_* Grace_kid.c colleen.log > /dev/null 2>&1

re		:	clean all

.PHONY:		all test colleen grace sully clean re