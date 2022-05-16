RED="\e[91m"
GREEN="\e[92m"
RESET="\e[0m"

CC = python3.7
SULLY = Sully.py
GRACE = Grace.py
COLLEEN = Colleen.py

all: colleen grace sully

test:
			@echo "--- TESTING ---\n"
			@echo "COLLEEN"
			@$(CC) $(COLLEEN) > colleen.log
			@diff colleen.log Colleen.py
			@if (diff colleen.log Colleen.py); then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi
			@echo "GRACE"
			@$(CC) $(GRACE)
			@diff Grace.py Grace_kid.py
			@if (diff Grace.py Grace_kid.py); then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi
			@echo "SULLY"
			@$(CC) $(SULLY)
			@if test -f "Sully_0.py" && test -f "Sully_1.py" && test -f "Sully_2.py" && test -f "Sully_3.py" && test -f "Sully_4.py"; then \
        		echo $(GREEN)"[OK]"$(RESET); \
    		else \
        		echo $(RED)"[KO]"$(RESET); \
    		fi

colleen:
			@$(CC) $(COLLEEN)

grace:
			@$(CC) $(GRACE)

sully:
			@$(CC) $(SULLY)

clean:
			@echo "Deleted all generated files"
			@rm Sully_* Grace_kid.py colleen.log > /dev/null 2>&1

re		:	clean all

.PHONY:		all test colleen grace sully clean re