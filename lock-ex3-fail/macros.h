// file: macros.h
//#define my_return(x) release_lock(); return x
#define my_return(x) do{ \
       	release_lock(); \
       	return x; \
}while(0)
