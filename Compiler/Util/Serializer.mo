/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-2014, Open Source Modelica Consortium (OSMC),
 * c/o Linköpings universitet, Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3 LICENSE OR
 * THIS OSMC PUBLIC LICENSE (OSMC-PL) VERSION 1.2.
 * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES
 * RECIPIENT'S ACCEPTANCE OF THE OSMC PUBLIC LICENSE OR THE GPL VERSION 3,
 * ACCORDING TO RECIPIENTS CHOICE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from OSMC, either from the above address,
 * from the URLs: http://www.ida.liu.se/projects/OpenModelica or
 * http://www.openmodelica.org, and in the OpenModelica distribution.
 * GNU version 3 is obtained from: http://www.gnu.org/copyleft/gpl.html.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */


encapsulated package Serializer
"file:        Serializer.mo
 package:     Serializer
 description: External Stream Utilities
 @author:     Leonardo Laguna Ruiz [leonardo@wolfram.com]
 @date:       2015-05-19


 This package provides functions to serialize MetaModelica data.
 The external C implementation is in TOP/Compiler/runtime/Serializer.c"

// Note: Reading back the data does not work as of 2018-02-19

public function outputFile<T> "
Prints the structure of the object."
  input T object;
  input String filename;
  external "C" Serializer_outputFile(object,filename) annotation(Library = {"omcruntime"});
end outputFile;

public function bypass<T> "
Serializes the object and reads it back. This function is used for testing purposes."
  input T object;
  output T out_object;
  external "C" out_object = Serializer_bypass(object) annotation(Library = {"omcruntime"});
end bypass;


annotation(__OpenModelica_Interface="util");
end Serializer;
