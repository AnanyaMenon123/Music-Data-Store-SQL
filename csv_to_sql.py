import csv

csv_file_path = 'playlist.csv'  # Replace with the actual path
table_name = 'playlist'
output_file_path = 'output_queries.sql'

# Read the CSV file and generate SQL queries
with open(csv_file_path, 'r', newline='', encoding='utf-8') as csvfile:
    csvreader = csv.reader(csvfile)
    header = next(csvreader)  # Skip the header

    # Open the output file in write mode
    with open(output_file_path, 'w', encoding='utf-8') as output_file:
        # Iterate through data rows and generate INSERT statements
        for row in csvreader:
            playlist_id = row[0]
            name = row[1].replace("'", "''")

            insert_query = f"INSERT INTO {table_name} (playlist_id, name) VALUES ({playlist_id}, '{name}');"
            
            # Write the query to the output file
            output_file.write(insert_query + '\n')
            
            # Print the query to the console as well
            print(insert_query)
