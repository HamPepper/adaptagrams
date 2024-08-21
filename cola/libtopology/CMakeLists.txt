project(topology)


file(GLOB inc CONFIGURE_DEPENDS "*.h")
file(GLOB src CONFIGURE_DEPENDS "*.cpp")


add_library(${PROJECT_NAME} SHARED ${inc} ${src})
target_include_directories(${PROJECT_NAME} PRIVATE ..)
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${inc}")
target_link_libraries(${PROJECT_NAME} PRIVATE vpsc)
target_link_libraries(${PROJECT_NAME} PRIVATE avoid)
target_link_libraries(${PROJECT_NAME} PRIVATE cola)
target_compile_definitions(${PROJECT_NAME} PRIVATE _AFXDLL)


install(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/lib${PROJECT_NAME})
