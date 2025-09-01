read_fasta_ids <- function(fasta_file) {
  fasta_lines <- readLines(fasta_file)
  fasta_ids <- sub("^>([^:]+).*", "\\1", fasta_lines[grep("^>", fasta_lines)])
  return(unique(fasta_ids))
}

# Function to read TXT IDs
read_txt_ids <- function(txt_file) {
  txt_lines <- readLines(txt_file)
  txt_ids <- sapply(strsplit(txt_lines, " "), `[`, 1)
  return(unique(txt_ids))
}

# Function to find matches
find_matches <- function(fasta_ids, txt_ids) {
  return(intersect(fasta_ids, txt_ids))
}

# Main function
main <- function(fasta_file, txt_file) {
  fasta_ids <- read_fasta_ids(fasta_file)
  txt_ids <- read_txt_ids(txt_file)
  
  matches <- find_matches(fasta_ids, txt_ids)
  
  cat("Matching IDs:\n")
  print(matches)
}
# Replace 'your_fasta_file.fasta' and 'your_txt_file.txt' with your actual file paths
main("motyvo_fasta.fasta", "pavad.txt")


fasta_file <- "motyvo_fasta.fasta"
if (!file.exists(fasta_file)) {
  cat("FASTA file does not exist.\n")
}