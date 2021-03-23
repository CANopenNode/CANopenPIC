#ifndef	_INTTYPES_H_
#define	_INTTYPES_H_

#include <stdint.h> /* Get the type definitions.  */

/*
 * ISO C99: 7.8.1 Macros for format specifiers
 *
 * Each of the following object-like macros185) expands to a character string 
 * literal containing a conversion specifier, possibly modified by a length 
 * modifier, suitable for use within the format argument of a formatted 
 * input/output function when converting the corresponding integer type. 
 * These macro names have the general form of PRI (character string literals 
 * for the fprintf and fwprintf family) or SCN (character string literals for 
 * the fscanf and fwscanf family),186) followed by the conversion specifier, 
 * followed by a name corresponding to a similar type name in 7.18.1. 
 * In these names, N represents the width of the type as described in 7.18.1. 
 * For example, PRIdFAST32 can be used in a format string to print the value 
 * of an integer of type int_fast32_t.
 */

/*******************************************/
/* Macros for printing format specifiers.  */
/*******************************************/

/* Decimal notation.  */
#define	PRId8			"d"         /* int8_t */
#define	PRId16			"d"         /* int16_t */
#define	PRId32			"ld"		/* int32_t */
#define	PRId64			"lld"		/* int64_t */

#define	PRIdLEAST8		"d"         /* int_least8_t */
#define	PRIdLEAST16		"d"         /* int_least16_t */
#define	PRIdLEAST32		"ld"		/* int_least32_t */
#define	PRIdLEAST64		"lld"		/* int_least64_t */

#define	PRIdFAST8		"d"         /* int_fast8_t */
#define	PRIdFAST16		"d"         /* int_fast16_t */
#define	PRIdFAST32		"ld"		/* int_fast32_t */
#define	PRIdFAST64		"lld"		/* int_fast64_t */

#define	PRIdMAX			"jd"		/* intmax_t */
#define	PRIdPTR			"ld"		/* intptr_t */

#define	PRIi8			"i"         /* int8_t */
#define	PRIi16			"i"         /* int16_t */
#define	PRIi32			"li"		/* int32_t */
#define	PRIi64			"lli"		/* int64_t */

#define	PRIiLEAST8		"i"         /* int_least8_t */
#define	PRIiLEAST16		"i"         /* int_least16_t */
#define	PRIiLEAST32		"li"		/* int_least32_t */
#define	PRIiLEAST64		"lli"		/* int_least64_t */

#define	PRIiFAST8		"i"         /* int_fast8_t */
#define	PRIiFAST16		"i"         /* int_fast16_t */
#define	PRIiFAST32		"li"		/* int_fast32_t */
#define	PRIiFAST64		"lli"		/* int_fast64_t */

#define	PRIiMAX			"ji"		/* intmax_t */
#define	PRIiPTR			"li"		/* intptr_t */

/* Octal notation.  */
#define	PRIo8			"o"         /* int8_t */
#define	PRIo16			"o"         /* int16_t */
#define	PRIo32			"lo"		/* int32_t */
#define	PRIo64			"llo"		/* int64_t */

#define	PRIoLEAST8		"o"         /* int_least8_t */
#define	PRIoLEAST16		"o"         /* int_least16_t */
#define	PRIoLEAST32		"lo"		/* int_least32_t */
#define	PRIoLEAST64		"llo"		/* int_least64_t */

#define	PRIoFAST8		"o"         /* int_fast8_t */
#define	PRIoFAST16		"o"         /* int_fast16_t */
#define	PRIoFAST32		"lo"		/* int_fast32_t */
#define	PRIoFAST64		"llo"		/* int_fast64_t */

#define	PRIoMAX			"jo"		/* intmax_t */
#define	PRIoPTR			"lo"		/* intptr_t */

/* Unsigned integers.  */
#define	PRIu8			"u"         /* uint8_t */
#define	PRIu16			"u"         /* uint16_t */
#define	PRIu32			"lu"		/* uint32_t */
#define	PRIu64			"llu"		/* uint64_t */

#define	PRIuLEAST8		"u"         /* uint_least8_t */
#define	PRIuLEAST16		"u"         /* uint_least16_t */
#define	PRIuLEAST32		"lu"		/* uint_least32_t */
#define	PRIuLEAST64		"llu"		/* uint_least64_t */

#define	PRIuFAST8		"u"         /* uint_fast8_t */
#define	PRIuFAST16		"u"         /* uint_fast16_t */
#define	PRIuFAST32		"lu"		/* uint_fast32_t */
#define	PRIuFAST64		"llu"		/* uint_fast64_t */

#define	PRIuMAX			"ju"		/* uintmax_t */
#define	PRIuPTR			"lu"		/* uintptr_t */

/* lowercase hexadecimal notation.  */
#define	PRIx8			"x"         /* uint8_t */
#define	PRIx16			"x"         /* uint16_t */
#define	PRIx32			"lx"		/* uint32_t */
#define	PRIx64			"llx"		/* uint64_t */

#define	PRIxLEAST8		"x"         /* uint_least8_t */
#define	PRIxLEAST16		"x"         /* uint_least16_t */
#define	PRIxLEAST32		"lx"		/* uint_least32_t */
#define	PRIxLEAST64		"llx"		/* uint_least64_t */

#define	PRIxFAST8		"x"         /* uint_fast8_t */
#define	PRIxFAST16		"x"         /* uint_fast16_t */
#define	PRIxFAST32		"lx"		/* uint_fast32_t */
#define	PRIxFAST64		"llx"		/* uint_fast64_t */

#define	PRIxMAX			"jx"		/* uintmax_t */
#define	PRIxPTR			"lx"		/* uintptr_t */

/* UPPERCASE hexadecimal notation.  */
#define	PRIX8			"X"         /* uint8_t */
#define	PRIX16			"X"         /* uint16_t */
#define	PRIX32			"lX"		/* uint32_t */
#define	PRIX64			"llX"		/* uint64_t */

#define	PRIXLEAST8		"X"         /* uint_least8_t */
#define	PRIXLEAST16		"X"         /* uint_least16_t */
#define	PRIXLEAST32		"lX"		/* uint_least32_t */
#define	PRIXLEAST64		"llX"		/* uint_least64_t */

#define	PRIXFAST8		"X"         /* uint_fast8_t */
#define	PRIXFAST16		"X"         /* uint_fast16_t */
#define	PRIXFAST32		"lX"		/* uint_fast32_t */
#define	PRIXFAST64		"llX"		/* uint_fast64_t */

#define	PRIXMAX			"jX"		/* uintmax_t */
#define	PRIXPTR			"lX"		/* uintptr_t */


/*******************************************/
/* Macros for scanning format specifiers.  */
/*******************************************/

/* Signed decimal notation.  */
#define	SCNd8			"hhd"		/* int8_t */
#define	SCNd16			"hd"		/* int16_t */
#define	SCNd32			"ld"		/* int32_t */
#define	SCNd64			"lld"		/* int64_t */

#define	SCNdLEAST8		"hhd"		/* int_least8_t */
#define	SCNdLEAST16		"hd"		/* int_least16_t */
#define	SCNdLEAST32		"ld"		/* int_least32_t */
#define	SCNdLEAST64		"lld"		/* int_least64_t */

#define	SCNdFAST8		"d"         /* int_fast8_t */
#define	SCNdFAST16		"d"         /* int_fast16_t */
#define	SCNdFAST32		"ld"		/* int_fast32_t */
#define	SCNdFAST64		"lld"		/* int_fast64_t */

#define	SCNdMAX			"jd"		/* intmax_t */
#define	SCNdPTR			"ld"		/* intptr_t */

/* Signed decimal notation.  */
#define	SCNi8			"hhi"		/* int8_t */
#define	SCNi16			"hi"		/* int16_t */
#define	SCNi32			"li"		/* int32_t */
#define	SCNi64			"lli"		/* int64_t */

#define	SCNiLEAST8		"hhi"		/* int_least8_t */
#define	SCNiLEAST16		"hi"		/* int_least16_t */
#define	SCNiLEAST32		"li"		/* int_least32_t */
#define	SCNiLEAST64		"lli"		/* int_least64_t */

#define	SCNiFAST8		"i"         /* int_fast8_t */
#define	SCNiFAST16		"i"         /* int_fast16_t */
#define	SCNiFAST32		"li"		/* int_fast32_t */
#define	SCNiFAST64		"lli"		/* int_fast64_t */

#define	SCNiMAX			"ji"		/* intmax_t */
#define	SCNiPTR			"li"		/* intptr_t */

/* Unsigned decimal notation.  */
#define	SCNu8			"hhu"		/* uint8_t */
#define	SCNu16			"hu"		/* uint16_t */
#define	SCNu32			"lu"		/* uint32_t */
#define	SCNu64			"llu"		/* uint64_t */

#define	SCNuLEAST8		"hhu"		/* uint_least8_t */
#define	SCNuLEAST16		"hu"		/* uint_least16_t */
#define	SCNuLEAST32		"lu"		/* uint_least32_t */
#define	SCNuLEAST64		"llu"		/* uint_least64_t */

#define	SCNuFAST8		"u"         /* uint_fast8_t */
#define	SCNuFAST16		"u"         /* uint_fast16_t */
#define	SCNuFAST32		"lu"		/* uint_fast32_t */
#define	SCNuFAST64		"llu"		/* uint_fast64_t */

#define	SCNuMAX			"ju"		/* uintmax_t */
#define	SCNuPTR			"lu"		/* uintptr_t */

/* Octal notation.  */
#define	SCNo8			"hho"		/* uint8_t */
#define	SCNo16			"ho"		/* uint16_t */
#define	SCNo32			"lo"		/* uint32_t */
#define	SCNo64			"llo"		/* uint64_t */

#define	SCNoLEAST8		"hho"		/* uint_least8_t */
#define	SCNoLEAST16		"ho"		/* uint_least16_t */
#define	SCNoLEAST32		"lo"		/* uint_least32_t */
#define	SCNoLEAST64		"llo"		/* uint_least64_t */

#define	SCNoFAST8		"o"         /* uint_fast8_t */
#define	SCNoFAST16		"o"         /* uint_fast16_t */
#define	SCNoFAST32		"lo"		/* uint_fast32_t */
#define	SCNoFAST64		"llo"		/* uint_fast64_t */

#define	SCNoMAX			"jo"		/* uintmax_t */
#define	SCNoPTR			"lo"		/* uintptr_t */

/* Hexadecimal notation.  */
#define	SCNx8			"hhx"		/* uint8_t */
#define	SCNx16			"hx"		/* uint16_t */
#define	SCNx32			"lx"		/* uint32_t */
#define	SCNx64			"llx"		/* uint64_t */

#define	SCNxLEAST8		"hhx"		/* uint_least8_t */
#define	SCNxLEAST16		"hx"		/* uint_least16_t */
#define	SCNxLEAST32		"lx"		/* uint_least32_t */
#define	SCNxLEAST64		"llx"		/* uint_least64_t */

#define	SCNxFAST8		"x"         /* uint_fast8_t */
#define	SCNxFAST16		"x"         /* uint_fast16_t */
#define	SCNxFAST32		"lx"		/* uint_fast32_t */
#define	SCNxFAST64		"llx"		/* uint_fast64_t */

#define	SCNxMAX			"jx"		/* uintmax_t */
#define	SCNxPTR			"lx"		/* uintptr_t */

typedef struct {
	intmax_t quot;                  /* Quotient */
	intmax_t rem;                   /* Remainder */
} imaxdiv_t;

#endif /* _INTTYPES_H_ */
