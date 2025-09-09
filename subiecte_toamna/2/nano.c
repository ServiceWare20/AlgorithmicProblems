#include <time.h>

int get_nano(void)
{
    struct timespec t={0,0};
    clock_gettime(CLOCK_MONOTONIC, &t);

    return 1000000000 * t.tv_sec + t.tv_nsec;
}
