ROBOT_LISTENER_API_VERSION = 2

indentation_offset = ""

def add_offset():
    global indentation_offset
    indentation_offset += "  "

def remove_offset():
    global indentation_offset
    indentation_offset = indentation_offset[:-2]

def start_keyword(name, attrs):
    #ignore_list = ['Selenium2Library', 'BuiltIn']
    ignore_list = []

    add_offset()

    if not(any(attrs['libname'] in s for s in ignore_list)):
        print '%s %s ' % (indentation_offset, attrs['kwname'])

def end_keyword(name, attrs):
    remove_offset()

def start_test(name, attrs):
    print '\n\n'
