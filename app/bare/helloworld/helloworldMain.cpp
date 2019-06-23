#include "public/common.h"

using namespace std;

extern "C" void __sync_synchronize()
{
}

int main()
{
    cout << "The Answer is: " << endl;

    return 0;
}
