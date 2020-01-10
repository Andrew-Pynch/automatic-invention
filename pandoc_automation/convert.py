import os # To access folders, call scripts etc
from subprocess import * # Run batch files and ps1 files

path = 'C:\\Users\\apynch\\Documents\\GitHub\\PCT.Historical_Documentation\\PCT File Share Documentation\\docs'
path_to_batch = 'C:\\Users\\apynch\\Documents\\GitHub\\PCT.Historical_Documentation\\PCT File Share Documentation\\docs\\convert.bat'
# Gets a list of all files within a path
def get_files(path, file_type):
    # Instantiate list of files
    files = []
    # r = root, d = directories, f = files
    for r, d, f in os.walk(path):
        for file in f:
            if file_type in file:
                files.append(file)

    return files



# Removes file extensions (returns list of list of chars)
def clear_filetype(files, file_type):
    extension_len = len(file_type)

    clean_files = []
    for f in files:
        f = list(f)
        f_clean = f[:len(f)-extension_len]

        # Add to list of cleaned files
        clean_files.append(f_clean)
    
    return clean_files


# Recomes list of list of chars into strings that are file names
def recombine_chars_filename(file_names_chars):
    file_names = []
    for i in file_names_chars:
        file = "".join(i)     
        file_names.append(file)

    return file_names   





# Prints all file names in a list of files
def print_files(files):
    for f in files:
        print(f)



# Calls a batch file to run with each filename in a list of files
# def call_batch(path_to_batch, files):
#     for f in files:
#         subprocess.call([r'%s' % (path_to_batch)])
#         subprocess.call(f)




# Get the names of the files in the current directory
files = get_files(path, '.docx')

# Remove file extensions
clean_files = clear_filetype(files, '.docx')

# Recombine list of chars into file_name that doesn't have the file extension ^
recombined_files = recombine_chars_filename(clean_files)

# Print all files
print_files(recombined_files)

# BROKEN - Just manually copied file names, I'm going to stop wasting time on this
# Run convert.bat on each file 
# call_batch(path_to_batch, recombined_files)




