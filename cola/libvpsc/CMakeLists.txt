project(vpsc)


# see https://stackoverflow.com/questions/3201154/automatically-add-all-files-in-a-folder-to-a-target-using-cmake
file(GLOB inc CONFIGURE_DEPENDS "*.h")
file(GLOB src CONFIGURE_DEPENDS "*.cpp")


add_library(${PROJECT_NAME} SHARED ${inc} ${src})
target_include_directories(${PROJECT_NAME} PRIVATE ..)
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${inc}")

# handling static class data members
include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME})
target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/..")


install(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/lib${PROJECT_NAME})
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/vpsc_export.h
        DESTINATION include/lib${PROJECT_NAME})