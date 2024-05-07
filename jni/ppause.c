#include <signal.h>

__attribute__((constructor))
void m() {
    raise(SIGSTOP);
}
