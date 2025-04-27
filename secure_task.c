#include <stdlib.h>
#include <unistd.h>

int main() {
    setuid(0); // Tries to make the process run with root privileges if the binary has a SUID bit and belongs to root
    system("echo Running as $(whoami)");
    return 0;
}
