def parse_fasta(file_path):
    """
    Parse a FASTA file and return a dictionary of {sequence_id: sequence}.
    Handles multi-line sequences and skips empty lines.
    """
    sequences = {}
    current_id = None
    current_seq = []

    with open(file_path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            if line.startswith('>'):
                # Save previous sequence
                if current_id:
                    sequences[current_id] = ''.join(current_seq)
                current_id = line[1:].split()[0] # take ID before first space
                current_seq = []
            else:
                current_seq.append(line.upper())

    # Save last sequence
    if current_id:
        sequences[current_id] = ''.join(current_seq)

    return sequences

def get_seq_stats(sequence):
    """
    Calculate basic stats for a DNA/RNA/Protein sequence.
    Returns length, GC content for DNA/RNA, and amino acid counts for protein.
    """
    seq = sequence.upper()
    length = len(seq)

    if not length:
        return {'length': 0}

    g_count = seq.count('G')
    c_count = seq.count('C')
    gc_content = ((g_count + c_count) / length) * 100 if length > 0 else 0

    return {
        'length': length,
        'gc_content_%': round(gc_content, 2),
        'a_count': seq.count('A'),
        't_u_count': seq.count('T') + seq.count('U'),
        'g_count': g_count,
        'c_count': c_count
    }

if __name__ == "__main__":
    # Example usage
    fasta_file = "example.fasta"
    seqs = parse_fasta(fasta_file)

    for seq_id, seq in seqs.items():
        stats = get_seq_stats(seq)
        print(f">{seq_id}")
        print(f"Length: {stats['length']} bp")
        print(f"GC Content: {stats['gc_content_%']}%")
        print(f"Sequence preview: {seq[:50]}...\n")
