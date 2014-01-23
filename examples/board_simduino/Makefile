# 
# 	Copyright 2008, 2009 Michel Pollet <buserror@gmail.com>
#
#	This file is part of simavr.
#
#	simavr is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	simavr is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with simavr.  If not, see <http://www.gnu.org/licenses/>.

target=	simduino
firm_src = ${wildcard atmega*.c}
firm_axf = ${firm_src:.c=.axf}
firmware = ${firm_src:.c=.hex}
simavr = ../../

src = ./src
inc = ./inc
src_files = ${notdir ${wildcard ${src}/*.c}}
inc_files = ${notdir ${wildcard ${inc}/*.h}}

cspec = ./cspec
cspec_src = ${cspec}/src
cspec_inc = ${cspec}/inc
cspec_src_files = ${notdir ${wildcard ${cspec_src}/*.c}}
cspec_inc_files = ${notdir ${wildcard ${cspec_inc}/*.h}}

test = ./test
test_src = ${test}/src
test_inc = ${test}/inc
test_src_files = ${notdir ${wildcard ${test_src}/*.c}}
test_inc_files = ${notdir ${wildcard ${test_inc}/*.h}}

IPATH = .
IPATH += ../parts
IPATH += ${simavr}/include
IPATH += ${simavr}/simavr/sim

AXF_INCLUDES = -I${inc} -I${cspec_inc} -I${test_inc}

VPATH = .
VPATH += ../parts
VPATH += ${src} ${inc} ${cspec_src} ${cspec_inc} ${test_src} ${test_inc}

LDFLAGS += -lpthread -lutil

include ../Makefile.opengl

all: obj ${firmware} ${target}

include ${simavr}/Makefile.common

board = ${OBJ}/${target}.elf

${board} : ${OBJ}/button.o
${board} : ${OBJ}/uart_pty.o
${board} : ${OBJ}/${target}.o

${firm_axf} : ${src_files} ${inc_files} ${cspec_src_files} ${cspec_inc_files} ${test_src_files} ${test_inc_files}

${target}: ${board}
	@echo $@ done

clean: clean-${OBJ}
	rm -rf *.a *.axf ${target} *.vcd *.hex
