# sigc++
find_path(SIGCXX_INC
          NAMES sigc++/sigc++.h
          PATH_SUFFIXES sigc++-2.0)
find_path(SIGCXX_CFG_INC
          NAMES sigc++config.h
          PATH_SUFFIXES lib/sigc++-2.0/include)
find_library(SIGCXX_LIB NAMES sigc-2.0)


# freetype2
find_path(FREETYPE_INC NAMES freetype/freetype.h)
find_library(FREETYPE_LIB NAMES freetype)


# cairo
find_path(CAIRO_INC
          NAMES cairo.h
          PATH_SUFFIXES cairo)
find_library(CAIRO_LIB NAMES cairo)


# cairomm
find_path(CAIROMM_INC
          NAMES cairomm/context.h
          PATH_SUFFIXES cairomm-1.0)
find_path(CAIROMM_CFG_INC
          NAMES cairommconfig.h
          PATH_SUFFIXES lib/cairomm-1.0/include)
find_library(CAIROMM_LIB NAMES cairomm-1.0 cairomm)


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CAIROMM DEFAULT_MSG
                                  CAIROMM_LIB CAIROMM_INC CAIROMM_CFG_INC
                                  CAIRO_LIB CAIRO_INC
                                  FREETYPE_LIB FREETYPE_INC
                                  SIGCXX_LIB SIGCXX_INC SIGCXX_CFG_INC)


set(CAIROMM_LIBRARIES ${CAIROMM_LIB} ${SIGCXX_LIB} ${FREETYPE_LIB} ${CAIRO_LIB})
set(CAIROMM_INCLUDE_DIRS
    ${CAIROMM_INC} ${CAIROMM_CFG_INC}
    ${SIGCXX_INC} ${SIGCXX_CFG_INC}
    ${FREETYPE_INC}
    ${CAIRO_INC})
