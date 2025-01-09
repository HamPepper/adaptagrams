project(topology)


file(GLOB inc CONFIGURE_DEPENDS "*.h")
file(GLOB src CONFIGURE_DEPENDS "*.cpp")


add_library(${PROJECT_NAME} SHARED ${src})
target_include_directories(${PROJECT_NAME} PUBLIC ..)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${inc}")
target_compile_definitions(${PROJECT_NAME} PRIVATE _AFXDLL)

target_link_libraries(${PROJECT_NAME} PUBLIC vpsc)
target_link_libraries(${PROJECT_NAME} PUBLIC avoid)
target_link_libraries(${PROJECT_NAME} PUBLIC cola)


install(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/lib${PROJECT_NAME})
