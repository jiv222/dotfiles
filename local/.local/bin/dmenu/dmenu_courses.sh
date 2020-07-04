#!/usr/bin/bash
# Dmenu script to browse current courses

course_select() {
    cd /home/four/School/current
    COURSE="$(ls | dmenu -l 6 -i -p 'Choose course:')"
    cd $COURSE
}

get_options() {
    # Variable options
    [ -f ./.textbook.pdf ] && OPTIONS="View course textbook\\n"
    [ -f ./.URL ] &&  OPTIONS="${OPTIONS}View course website\\n"
    [ -f ./.components.txt ] && OPTIONS="${OPTIONS}View course grade composition\\n"
    # Constant options 
    OPTIONS="${OPTIONS}View course syllabus\\nView all courses\\nQuit"
}

course_menu() {
    unset OPTIONS
    get_options
    case "$(echo -e "$OPTIONS" | dmenu -l 5 -i -p 'Course Options:')" in
        'View course grade composition') awk -F: '{print $2, $1}' .components.txt | dmenu -l 5 -p 'Weights of course components:' && course_menu ;;
        'View course syllabus') zathura syllabus.pdf ;;
        'View course textbook') zathura .textbook.pdf ;;
        'View course website') URL="$(cat .URL)" && firefox $URL ;;
        'View all courses') dmenu_courses ;;
        'Quit') exit 0
    esac
}

dmenu_courses() {
    course_select
    course_menu
}

dmenu_courses
