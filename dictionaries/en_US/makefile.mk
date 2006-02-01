#*************************************************************************
#
#   OpenOffice.org - a multi-platform office productivity suite
#
#   $RCSfile: makefile.mk,v $
#
#   $Revision: 1.16 $
#
#   last change: $Author: kz $ $Date: 2006-02-01 16:41:46 $
#
#   The Contents of this file are made available subject to
#   the terms of GNU Lesser General Public License Version 2.1.
#
#
#     GNU Lesser General Public License Version 2.1
#     =============================================
#     Copyright 2005 by Sun Microsystems, Inc.
#     901 San Antonio Road, Palo Alto, CA 94303, USA
#
#     This library is free software; you can redistribute it and/or
#     modify it under the terms of the GNU Lesser General Public
#     License version 2.1, as published by the Free Software Foundation.
#
#     This library is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     Lesser General Public License for more details.
#
#     You should have received a copy of the GNU Lesser General Public
#     License along with this library; if not, write to the Free Software
#     Foundation, Inc., 59 Temple Place, Suite 330, Boston,
#     MA  02111-1307  USA
#
#*************************************************************************

PRJ = ..

PRJNAME	= dictionaries
TARGET	= dict_en_US

#----- Settings ---------------------------------------------------------

.INCLUDE : settings.mk

# --- Files --------------------------------------------------------

.IF "$(DIC_ALL)$(DIC_ENUS)"!=""

DIC2BIN= \
    en_US.aff \
    en_US.dic \
    hyph_en_US.dic

.ENDIF

# add WordNet license to American and British English
.IF "$(DIC_ALL)$(DIC_ENUS)$(DIC_ENGB)"!=""

DIC2BIN+= \
    WordNet_license.txt

.ENDIF

# --- Targets ------------------------------------------------------

.INCLUDE : target.mk
.INCLUDE : $(PRJ)$/util$/target.pmk

# add WordNet thesaurus to American and British English
.IF "$(DIC_ALL)$(DIC_ENUS)$(DIC_ENGB)"!=""

ALLTAR : $(MISC)$/th_en_US_v2.don

$(MISC)$/th_en_US_v2.don: th_en_US_v2.zip
    +cd $(BIN) && $(WRAPCMD) unzip -o $(PWD)$/th_en_US_v2.zip
    +$(PERL) $(PRJ)$/util$/th_gen_idx.pl -o $(BIN)$/th_en_US_v2.idx <$(BIN)$/th_en_US_v2.dat && $(TOUCH) $(MISC)$/th_en_US_v2.don

.ENDIF			# "$(DIC_ALL)$(DIC_ENUS)$(DIC_ENGB)"!=""
