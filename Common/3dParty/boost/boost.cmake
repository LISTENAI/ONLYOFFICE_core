find_package(
    Boost
    REQUIRED
    NO_MODULE
    COMPONENTS system filesystem regex date_time
)

target_link_libraries(${CMAKE_CURRENT_MODULE} PRIVATE
    Boost::system
    Boost::filesystem
    Boost::regex
    Boost::date_time
)
