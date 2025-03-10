
# Try to find the GNU Multiple Precision Arithmetic Library (GMP)
# See http://gmplib.org/

if (GMP_INCLUDE_DIR AND GMP_LIBRARIES)
  set(GMP_FIND_QUIETLY TRUE)
endif (GMP_INCLUDE_DIR AND GMP_LIBRARIES)

find_path(GMP_INCLUDE_DIR
  NAMES
  gmp.h
  PATHS
  $ENV{GMPDIR}
  ${INCLUDE_INSTALL_DIR}
)

find_library(GMP_LIBRARY gmp PATHS $ENV{GMPDIR} ${LIB_INSTALL_DIR})

find_package_handle_standard_args(GMP DEFAULT_MSG
                                  GMP_INCLUDE_DIR GMP_LIBRARY)

if(GMP_FOUND AND NOT TARGET GMP::GMP)
    add_library(GMP::GMP INTERFACE IMPORTED)
    target_include_directories(GMP::GMP INTERFACE ${GMP_INCLUDE_DIR})
    target_link_libraries(GMP::GMP INTERFACE ${GMP_LIBRARY})
endif()

set(GMP_LIBRARIES GMP::GMP)

include(FindPackageHandleStandardArgs)
mark_as_advanced(GMP_INCLUDE_DIR GMP_LIBRARIES)
