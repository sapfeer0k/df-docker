# Dwarf Fortress docker image
This is a dockerfile for running the game Dwarf Fortress inside the docker container. The latest game version is 44.12. The 32bit executable has been used in the image. This version doesn't support any graphical interface, except **TEXT**. By default you would need to mount save folder to persist your game progress. 

## Usage

First you need to build it:

`docker build . -t dwarf-fortress`

Then, you need to run your image (use --rm to clean up after you have stopped your container):

`docker run --rm -ti -v df-saves:/df_linux/data/save/ dwarf-fortress dwarf-fortress`

