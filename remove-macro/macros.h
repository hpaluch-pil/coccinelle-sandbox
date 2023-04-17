// file: macros.h
#define my_return(x) release_lock(); return x
// real macro is: #define my_return(x) { release_lock(); return x; }
// but it causes error "dead code detected"
