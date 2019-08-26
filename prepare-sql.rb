password_file = ARGV[0]
target_sql_file = ARGV[1]

def write_to_sql(target, hash, count, prefix)
  target.puts("#{hash},#{count},#{prefix}")
end

# open the target file in append mode
open(target_sql_file, 'a') {|target|
  # process the pwned password source file
  File.open(password_file, 'r').each_line do |line|
    data = line.split(/\r\n/)
    hash, count = data.map{|d| d.split(":")}.flatten
    prefix = hash[0..4]
    write_to_sql(target, hash, count, prefix)
  end
} # close target sql file
