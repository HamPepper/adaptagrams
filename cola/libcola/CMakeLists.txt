project(cola)


configure_file(config.h.in config.h)


file(GLOB inc CONFIGURE_DEPENDS "*.h")
file(GLOB src CONFIGURE_DEPENDS "*.cpp")


add_library(${PROJECT_NAME} SHARED ${inc} ${src})
target_include_directories(${PROJECT_NAME} PRIVATE ..)
target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/..")
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${inc}")

if (CAIROMM_FOUND)
    target_include_directories(${PROJECT_NAME} PRIVATE ${CAIROMM_INCLUDE_DIRS})
    target_link_libraries(${PROJECT_NAME} PRIVATE ${CAIROMM_LIBRARIES})
endif()


install(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION lib
        PUBLIC_HEADER DESTINATION include/lib${PROJECT_NAME})
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/config.h
        DESTINATION include/lib${PROJECT_NAME})
