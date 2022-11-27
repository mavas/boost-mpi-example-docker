#include <boost/mpi.hpp>
#include <boost/mpi/environment.hpp>
#include <boost/mpi/communicator.hpp>
#include <iostream>


namespace mpi = boost::mpi;


int main()
{
    mpi::environment env;
    mpi::communicator world;

    std::cout << "I am process " << world.rank() << " of " << world.size()
        << "." << std::endl;
    std::string s(env.processor_name());
    std::cout << "Processor name: " << s << "\n";
    std::cout << "testing!!!!\n";

    return 0;
}
