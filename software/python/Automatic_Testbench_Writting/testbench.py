def write(name: str) -> None:
    """
    Use to write the testbench for the given name according to the data from the header and the data text files
    :param name: String use for the name of the output
    :return: Only board effect, create the testbench
    """
    headerFile = r"Include/header.txt"
    dataFile = r"Include/data.txt"

    outFile = f"Output/{name}.vhdl"

    waitLine = "            wait for 10 ns ;"
    decLine = "            i_data_bus <= "
    endLine = "        end process;\r\rend testbench;"

    with open(headerFile, 'r') as head:
        header = head.readlines()
    head.close()

    with open(dataFile, 'r') as dat:
        data = dat.readlines()
    dat.close()

    with open(outFile, 'w') as out:
        for line in header:
            out.write(line)

        out.write('\r')

        for line in data:
            line = line.replace('\r', '')
            line = line.replace('\n', '')
            out.write(f'{decLine}\"{line}\";\r{waitLine}\r')
        out.write(endLine)

    out.close()