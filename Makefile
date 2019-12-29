NAME 	= test

OUT 	= functionoutput

SRCPATH = ../ft_printf

LIB		= $(SRCPATH)/libftprintf.a

FT_OUT 	= ft_printf.txt

OUT_GEN = testgen.c

P_OUT 	= printf.txt

TESTS 	= dec char str per hex u n ptr null

TESTALL = $(TESTS)

UC 		= $(shell echo $(TEST) | tr '[:lower:]' '[:upper:]')

TESTER 	= test.c

HEADER 	= test.h

CFLAGS 	= -Wall -Wextra -Werror

CMD		= gcc $(CFLAGS) $(OUT_GEN) -L$(SRCPATH) -lftprintf -o $(OUT)

ifdef WITH_BONUS
OBJ = $(SOBJ) $(BOBJ)
else
OBJ = $(SOBJ)
endif

ifdef WITH_DEC
TEST = decimal
endif

ifdef WITH_STR
TEST = string
endif

ifdef WITH_CHAR
TEST = char
endif

ifdef WITH_PER
TEST = percent
endif

ifdef WITH_HEX
TEST = hex
endif

ifdef WITH_UINT
TEST = uint
endif

ifdef WITH_PTR
TEST = ptr
endif

ifdef WITH_N
TEST = nstore
endif

ifdef WITH_NULL
TEST = null
endif

# COLORS
BLUE	= \x1b[34;01m
CYAN	= \x1b[36;01m
PINK	= \x1b[35;01m
GREEN	= \x1b[32;01m
WHITE	= \x1b[37;01m
YELLOW	= \x1b[33;01m
RED		= \x1b[31;01m
NOCOL	= \x1b[0m

# SYMBOLS
SPONGE 	= 🚿
BATH	= 🛁
TOILET	= 🚽
BOOKS	= 📚
BOOK1	= 📙
BOOK2	= 📓
FOLDER	= 📂
YAY		= 🎉
GO		= 🏃‍♀️

all: $(NAME)

$(NAME):
	@echo ""
	@echo "$(CYAN)      *~*~*~*~*~* The ~ a e s t h e t i c ~ ft_printf tester *~*~*~*~*~"
	@echo "      |                                                                |"
	@echo "      |    - make tests : run all tests                                |"
	@echo "      |    - make dec : run decimal tests                              |"
	@echo "      |    - make char : run char tests                                |"
	@echo "      |    - make str : run string tests                               |"
	@echo "      |    - make per : run percent tests                              |"
	@echo "      |    - make ptr : run pointer tests                              |"
	@echo "      |    - make u : run unsigned decimal tests                       |"
	@echo "      |    - make hex : run hex tests                                  |"
	@echo "      |    - make n : run n tests                                      |"
	@echo "      |    - make open : open output files                             |"
	@echo "      |    - make norm : run norminette                                |"
	@echo "      |    - make pikachu : surprise                                   |"
	@echo "      |    - make pikasad : run all tests without Pikachu              |"
	@echo "      |                                                                |"
	@echo "      ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
	@echo ""

tests: $(LIB) $(TESTALL)
	@$(MAKE) pikachu
	@$(MAKE) pass

run: $(OUT_GEN) $(LIB)
	@echo "$(PINK)Compiling files"
	@$(CMD)
	@echo "$(BLUE)Generating output"
	@./$(OUT) $(TEST) >> $(FT_OUT)
	@rm $(OUT)
	@gcc $(TESTER) -o $(NAME)
	@echo "$(CYAN)Running $(UC) test$(WHITE)"
	@./$(NAME)

$(LIB): 
	@cd $(SRCPATH) && $(MAKE)

dec:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_DEC=1
	@$(MAKE) sclean

char:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_CHAR=1
	@$(MAKE) sclean

str:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_STR=1
	@$(MAKE) sclean

per:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_PER=1
	@$(MAKE) sclean

hex:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_HEX=1
	@$(MAKE) sclean

u:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_UINT=1
	@$(MAKE) sclean

n:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_N=1
	@$(MAKE) sclean

ptr:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_PTR=1
	@$(MAKE) sclean

null:
	@rm -f $(FT_OUT) $(P_OUT)
	@$(MAKE) run WITH_NULL=1
	@$(MAKE) sclean

norm:
	@norminette $(SRC)

open: $(P_OUT) $(FT_OUT)
	@open $(P_OUT) $(FT_OUT)

pass:
	@echo ""
	@echo "$(YAY) $(YELLOW)You Passed! $(YAY)"
	@echo ""

# run tests without Pikachu picture

pikasad: $(TESTALL)
	@echo ""
	@echo "$(YELLOW)You passed."
	@echo "But success without friends is a lonely path."
	@echo ""

# normal cleaning

clean:
	@echo "$(SPONGE) $(WHITE)Cleaning $(SPONGE)"
	@rm -f $(NAME)
	@echo "$(GO) $(GREEN)Heading to the library $(GO)"
	@cd $(SRCPATH) && $(MAKE) clean


fclean: clean
	@echo "$(BATH) $(CYAN)Clean af $(BATH)"
	@rm -f $(FT_OUT) $(P_OUT)
	@echo "$(GO) $(GREEN)Heading to the library $(GO)"
	@cd $(SRCPATH) && $(MAKE) fclean

# silent cleaning

sclean:
	@rm -f $(NAME)
	@cd $(SRCPATH) && $(MAKE) clean

sfclean: sclean
	@rm -f $(FT_OUT) $(P_OUT)
	@cd $(SRCPATH) && $(MAKE) fclean

re:
	@echo "$(TOILET) $(PINK)Once more from the top $(TOILET)"
	@$(MAKE) fclean
	@$(MAKE) tests

.PHONY: all clean fclean re

pikachu:
	@echo "$(YELLOW),*************,,*/(((((//,,*(#%%%%%%%%%%%%%%%#(*,,,****************************************************,*/(((((((((/((((////****/((##%%%%%%"
	@echo ",*************,,//((((((//,,*(%%%%%%%%%%%%%%%%%##/*****************************************************,,*/(///(//////****//((##%%%%%%%%%%%"
	@echo ",************,,*/(((((((//***/#%%%%%%%%%%%%%%%%%%%#(/***************************************************,*//////////*//((#%%%%%%%%%%%%%%%%%"
	@echo ",***********,,*////////////***/##%%%%%%%%%%%%%%%%%%%##(*,***********************************************,,*////////(###%%%%%%%%%%%%%%%%%%%%"
	@echo ",**********,,,*/*******//////**/(#%%%%%%%%%%%%%%%%%%%%%#(/**********************************************,,,***/(##%%%%%%%%%%%%%%%%%%%%%%%%%"
	@echo ",*********,,,,*************///***/(#%%%%%%%%%%%%%%%%%%%%%%#(/***********************************,****,****/((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#"
	@echo ",*********,,,***************//****/(##%%%%%%%%%%%%%%%%%%%%%%##//**************//////////////////////((#####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#("
	@echo ",********,,,,***********************/(#%%%%%%%%%%%%%%%%%%%%%%%##################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(/"
	@echo ",*******,..,***********************,,*/##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%###((//"
	@echo ",*******,.,,***********************,,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(//**//"
	@echo ",******,.,,,************************,,,,*/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(//*******"
	@echo ",*****,,,,,********,***,,,,,,,,,,,,*,,,,,,*/(######%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(/**********"
	@echo ",*****,..,*******,,,,,,,,,,,,,,,,,,,,,,*,,,,*///((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%###(/************"
	@echo ",*****,,,*******,,,,,*,,,,,,,,,,,,,,,,,****,,,*/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#######(//**************"
	@echo ",****,.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**,,,/(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#((//******************"
	@echo ",***,..,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..,,,,,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*******************"
	@echo ",**,,.,,,,,,,,,,,,,,,,,,,,,,,,,,.......,,,,,,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#####%%%%%%%%%%%%%%%%#(/******************"
	@echo ",**,..,,,,,,,,,,,,,,,,,,,,,,,,,......,,,*,,,*(#%%%%%%%%##(((/(##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(((/*/((#%%%%%%%%%%%%%%#(/*****************"
	@echo ",*,..,,,,,,,,,,,,,,,,,,,,,,,,,,,.....,,**,,*/#%%%%%%%##((((*,**/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%##((##/,,,*(#%%%%%%%%%%%%%%#(*****************"
	@echo ".*,.,,,**,,,,,,,,,,,,,,,,,,,,,,,,,,*****,,,/(%%%%%%%%#(//(#/,..*/#%%%%%%%%%%%%%%%%%%%%%%%%%%%#(//(#/,..,/(#%%%%%%%%%%%%%%#/*****///////////"
	@echo ".,..,,,,,,,,,,,,,,,,,,,,,,,,,,*,,*******,,,(#%%%%%%%%#(*,,,....,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%#(*,,,....,/(#%%%%%%%%%%%%%%#(*,**////////////"
	@echo ".,..,,,,,,,,,...........,,,,,,*,********,,*(#%%%%%%%%%#(/*,,...,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*,,..,*/##%%%%%%%%%%%%%%%#(***////////////"
	@echo "...,,,,,,,................,,*,**********,,/#%%%%%%%%%%%%#((////((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##((///(#%%%%%%%%%%%%%%%%%%(/**////////////"
	@echo " ..,,,,,,.................,,,**********,,*(#%%%%%%%%%%%%%%%%%%#%%%%%%%%#((///((#%%%%%%%%%%%%%%%%%%%%%#%%%%%%%%%%%%%%%%%%%%%#/**////////////"
	@echo ".,,,,,,,,.................,,***********,,/(####%%%%%%%%%%%%%%%%%%%%%%%%#(/*,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*////////////"
	@echo ".,***,,,,,,..............,,,**********,..,***//((##%%%%%%%%%%%%%%%%%%%%%%%##((##%%%%%%%%%%%%%%%%%%%%%%%%%##(((((((((###%%%%%#/**///////////"
	@echo ".*****,,,,,,,,,,,,,,,,,,,*************,..,$(RED)*******/$(YELLOW)(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##$(RED)///*//////$(YELLOW)((#%%%%%#(**///////////"
	@echo ".****************/******/***////*****,.,$(RED)*///////**/$(YELLOW)#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#($(RED)////////////$(YELLOW)(#%%%%%#/**//////////"
	@echo ".***********************/////*******,..,$(RED)*//////////$(YELLOW)(#%%%%%%%%%%%%%%%%%%%%##########%%%%%%%%%%%%%%%%%%%%#($(RED)///////////*/$(YELLOW)(#%%%%%#(***/////////"
	@echo ".************************///********,..,$(RED)*//////////$(YELLOW)#%%%%%%%%%%%%%%%%%%#(//*****///(((##%%%%%%%%%%%%%%%%#($(RED)///////////**/$(YELLOW)##%%%%##/***////////"
	@echo ".***********************************,.,,$(RED)***///////$(YELLOW)(#%%%%%%%%%%%%%%%%#(/*,,,*//((((////(#%%%%%%%%%%%%%%%#(($(RED)////////////$(YELLOW)(#%%%%%%#(*********//"
	@echo ",***********,,,*,,*,,**************,,,*//$(RED)******//$(YELLOW)(#%%%%%%%%%%%%%%%%%#(*,,*/(((#####(((((#%%%%%%%%%%%%%%%##$(RED)///////////$(YELLOW)(#%%%%%%%%#(***///////"
	@echo ",*************,,**,,,************,,,,,/(##((((####%%%%%%%%%%%%%%%%%%%(/**/(((#((((#((//(#%%%%%%%%%%%%%%%%%#(((((((((##%%%%%%%%%%#/**///////"
	@echo ",******************************,,,,,,,*(#%#%%%%%%%%%%%%%%%%%%%%%%%%%%#(**/((#(#(((#((//(#%%%%%%%%%%%%%%%%%%%%%%%#%#%%%%%%%%%%%%%#(**///////"
	@echo ",*************,**************,****,,,,,/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*/((((#((((///(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(/*///////"
	@echo ",*************************************,*/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(////////////(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#/**/////*"
	@echo ",******////****///////////////////////***/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%####(((((((###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(********"
	@echo ".,*,****///////////////////////////////***/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*******"
	@echo ".,,,,*****//////////////////////////*******(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(*******"
	@echo ".,,,,,,***********/////////////////********/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(*******"
	@rm -f $(NAME)
