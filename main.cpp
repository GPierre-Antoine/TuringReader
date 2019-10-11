//
// Created by pierreantoine on 11/10/2019.
//

#include <iostream>
#include "turingparser.hpp"


int main(int argc, char **argv)
{
    try
    {
        for (std::size_t index = 1; index<argc; ++index)
        {
            std::cout << "Reading : " << argv[index] << std::endl;
            freopen(argv[index], "r", stdin);
            yyparse();
        }
    }
    catch (const std::runtime_error & e)
    {
        std::cerr << "Bison error : " << e.what() << std::endl;
    }
    return 0;
}