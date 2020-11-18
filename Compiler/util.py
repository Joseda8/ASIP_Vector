def generator(path):
    word = ''
    with open(path) as file:
        while True:
            char = file.read(1)
            if char.isspace():
                if word:
                    yield word
                    word = ''
            elif char == '':
                if word:
                    yield word
                break
            else:
                word += char
    return word

def get_imm(number):
    set_value = bin(int(number))[2:]
    imm = ""

    i = 0 
    while(i<26-len(set_value)):
        imm += "0"
        i += 1
    imm += set_value
    return imm

def replace_cycle(file):

    new_code = []

    code = open(file, "r")

    cycles = 0
    cycle_instr = []
    in_cycle = False
    for instr in code:
        if("CYCLE" in instr):
            in_cycle = True
            cycles = int(instr.replace("CYCLE ", ""))
        elif("END" in instr):    
            i = 0
            while(i<cycles):
                for ins_cycle in cycle_instr:
                    new_code.append(ins_cycle)
                i += 1
            cycle_instr = []
            in_cycle = False
        else:
            if(in_cycle):
                cycle_instr.append(instr)
            else:
                new_code.append(instr)
    code.close()
    
    code_exe = open("code.txt", "w")
    for instr in new_code:
        code_exe.write(instr)
    code_exe.close()