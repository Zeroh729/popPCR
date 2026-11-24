#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .C calls */
extern void ddmix2(double *, int *, int *, int *, int *, const double *, const double *, const double *, const double *, double *, int *);
extern void emskewfit1(double *, int *, int *, int *, int *, int *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, int *, int *, int *, double *, int *);
extern void emskewfit2(double *, int *, int *, int *, int *, int *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, int *, int *, int *, double *);
extern void initfit_(double *, int *, int *, int *, int *, int *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, double *, int *, int *, int *);
extern void interdist_(double *, int *, int *, int *, int *, double *, double *, double *, double *, int *);
extern void intradist_(double *, int *, int *, int *, int *, double *, double *, double *, double *, int *);
extern void mahalonobis_(int *, int *, double *, double *, double *, int *);

/* .Fortran calls */
extern void F77_NAME(inverse3)(double *, double *, double *, int *, int *, int *, int *);

static const R_CMethodDef CEntries[] = {
    {"ddmix2",       (DL_FUNC) &ddmix2,       11},
    {"emskewfit1",   (DL_FUNC) &emskewfit1,   32},
    {"emskewfit2",   (DL_FUNC) &emskewfit2,   28},
    {"initfit_",     (DL_FUNC) &initfit_,     27},
    {"interdist_",   (DL_FUNC) &interdist_,   10},
    {"intradist_",   (DL_FUNC) &intradist_,   10},
    {"mahalonobis_", (DL_FUNC) &mahalonobis_,  6},
    {NULL, NULL, 0}
};

static const R_FortranMethodDef FortranEntries[] = {
    {"inverse3", (DL_FUNC) &F77_NAME(inverse3), 7},
    {NULL, NULL, 0}
};

void R_init_EMMIXskew(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, FortranEntries, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
