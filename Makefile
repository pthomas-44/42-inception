# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthomas <pthomas@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/12 15:24:38 by pthomas           #+#    #+#              #
#    Updated: 2022/05/20 14:14:47 by pthomas          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#========================================#
#=============== VARIABLES ==============#
#========================================#

#~~~~ Output ~~~~#

NAME		= inception

#~~~~ DOCKER ~~~~#

COMPOSE		= docker-compose --project-directory=srcs -p $(NAME)

#========================================#
#=============== TARGETS ================#
#========================================#

#~~~~ Main ~~~~#

all:		create

re:			fclean create

up:			build
			$(COMPOSE) up --detach

down:
			$(COMPOSE) down

#~~~~ Build ~~~~#

build:		volumes
			$(COMPOSE) build --parallel

create:		build
			$(COMPOSE) create

#~~~~ Debug ~~~~#

ps:
			$(COMPOSE) ps --all

exec:
ifeq '$(CONTAINER)' ''
	@echo "Usage: CONTAINER=<CONTAINER_NAME> make exec"
else
	$(COMPOSE) exec $(CONTAINER) /bin/sh
endif

#~~~~ Essantial ~~~~#

start:
			$(COMPOSE) start

restart:
			$(COMPOSE) restart
stop:
			$(COMPOSE) stop

#~~~~ Cleaning ~~~~#

clean:		down

fclean:
			docker-compose --project-directory=srcs down --rmi all --volumes
			sudo rm -rf /home/$(USER)/data/*
			docker volume rm wp-db wp-site

#~~~~ Misc ~~~~#

volumes:
			@mkdir -p /home/$(USER)/data/site
			@mkdir -p /home/$(USER)/data/db

#~~~~ Eugene ~~~~#

eugene :	
			@ echo "               _,........__"
			@ echo "            ,-'            \"\`-."
			@ echo "          ,'                   \`-."
			@ echo "        ,'                        \\"
			@ echo "      ,'                           ."
			@ echo "      .'\\               ,\"\".       \`"
			@ echo "     ._.'|             / |  \`       \\"
			@ echo "     |   |            \`-.'  ||       \`."
			@ echo "     |   |            '-._,'||       | \\"
			@ echo "     .\`.,'             \`..,'.'       , |\`-."
			@ echo "     l                       .'\`.  _/  |   \`."
			@ echo "     \`-.._'-   ,          _ _'   -\" \\  .     \`"
			@ echo "\`.\"\"\"\"\"'-.\`-...,---------','         \`. \`....__."
			@ echo ".'        \`\"-..___      __,'\\          \\  \\     \\"
			@ echo "\\_ .          |   \`\"\"\"\"'    \`.           . \\     \\"
			@ echo "  \`.          |              \`.          |  .     L"
			@ echo "    \`.        |\`--...________.'.        j   |     |"
			@ echo "      \`._    .'      |          \`.     .|   ,     |"
			@ echo "         \`--,\\       .            \`7\"\"' |  ,      |"
			@ echo "            \` \`      \`            /     |  |      |    _,-'\"\"\"\`-."
			@ echo "             \\ \`.     .          /      |  '      |  ,'          \`."
			@ echo "              \\  v.__  .        '       .   \\    /| /              \\"
			@ echo "               \\/    \`\"\"\\\"\"\"\"\"\"\"\`.       \\   \\  /.''                |"
			@ echo "                \`        .        \`._ ___,j.  \`/ .-       ,---.     |"
			@ echo "                ,\`-.      \\         .\"     \`.  |/        j     \`    |"
			@ echo "               /    \`.     \\       /         \\ /         |     /    j"
			@ echo "              |       \`-.   7-.._ .          |\"          '         /"
			@ echo "              |          \`./_    \`|          |            .     _,'"
			@ echo "              \`.           / \`----|          |-............\`---'"
			@ echo "                \\          \\      |          |"
			@ echo "               ,'           )     \`.         |"
			@ echo "                7____,,..--'      /          |"
			@ echo "                                  \`---.__,--.'"
								  
.PHONY:		all re up down build create ps exec start restart stop clean fclean eugene
