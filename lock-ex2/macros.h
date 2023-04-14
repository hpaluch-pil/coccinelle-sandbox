// file: macros.h
#define my_return(x) do{ release_lock(); return x; }while(0)
