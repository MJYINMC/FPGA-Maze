import sys

audio = open(sys.argv[1], "rb")
coe = open("audio.coe", "w")
coe.write("memory_initialization_radix = 16;\nmemory_initialization_vector =\n")
audio.seek(0x2E,0)

while True:
    data = audio.read(2)
    if data:
    #     value = int().from_bytes(data, byteorder='little', signed=False)
        data = data[::-1]
        coe.write(data.hex()+'\n')
    #     pcm.write(data)
    else:
        break
audio.close()
coe.close()