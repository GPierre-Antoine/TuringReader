//
// Created by pierreantoine on 11/10/2019.
//

#include <iostream>
#include "turingparser.hpp"


int main()
{
    try
    {
        yyparse();
    }
    catch (const std::runtime_error & e)
    {
        std::cerr << "Bison error : " << e.what() << std::endl;
    }
    return 0;
}