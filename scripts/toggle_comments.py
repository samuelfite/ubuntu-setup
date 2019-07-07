import sys, os, logging
from datetime import datetime
# [program, modFile, 0=#off||1=#on||3=toggle#, 
# number of comment blocks from top|| -1 for all]
args = [0,0,0,0]

def write_to_file( data ):
    global args
    with open( args[1],"w") as conf:
        conf.writelines( data )

def create_backup( data ):
    global args
    #read file and create a backup
    with open( args[1],"r") as conf:
        data = conf.readlines()
        # CREATE BACKUP
        config_file_bak = args[1]+".bak"
        with open( config_file_bak ,"w+") as bak:
            bak.writelines( data )

# ---MAIN---, argv[1] = config file, argv[2] = mode; see above
def main():
    time = datetime.now().strftime('%H-%M-%S__%d-%m-%Y')
    log_name = "/home/sam/.log/hms_dmy_" + time + ".log"
    logging.basicConfig(filename=log_name, level=logging.DEBUG)
    global args
    # get config filename from first arg
    for i in range(0,len(sys.argv)):
        args[i] = str(sys.argv[i])

    # read file
    with open( args[1], "r" ) as conf:
        data = conf.readlines()
        # create a backup of the config file
        create_backup( data )

    # loop through file and look for edit flag
    edit = 0
    blocks = 0
    line_number = 0
    for index in range(0,len(data)):
        line_number += 1
        line = data[index]
        #if we found the start edit flag
        if 'PYTHONEDIT' in line:
            blocks += 1
            logging.debug("Comment block: " + str(blocks))
            edit = 1
            continue
        #if we found the end edit flag
        if 'EDITPYTHON' in line:
            edit = 0

        # if our edit flag is set and we are on the right comment block or were doing all
        if edit and (blocks == int(args[3]) or int(args[3]) == -1):
            s = line
            #if the line is not commented and third arg isn't "off"
            if ('#' not in line or line.index('#') != 0) and int(args[2]) != 0:
                logging.debug( "adding comment: line " + str(line_number) )
                # add\# to beginning
                s = ""
                s = "#"+line
            #if the line is commented and third arg isn't "on"
            elif '#' in line and int(args[2]) != 1:
                logging.debug( "removing comment: line " + str(line_number) )
                #remove from beginning\#
                s = ""
                s = line[ 1:len( line ) ]
            # set the line equal to the modified string
            data[ index ] = s

    # write our new config and exit
    logging.debug( "writing and exiting" )
    write_to_file( data )
    sys.exit( 0 )

if __name__=="__main__":
    main()
