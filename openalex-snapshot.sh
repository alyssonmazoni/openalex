aws s3 sync "s3://openalex" "openalex-snapshot" --no-sign-request

bq mk insyspo:publicdb_openalex_2024_02

bq mk --table insyspo:publicdb_openalex_2024_02.works work:string
bq mk --table insyspo:publicdb_openalex_2024_02.authors author:string
bq mk --table insyspo:publicdb_openalex_2024_02.sources source:string
bq mk --table insyspo:publicdb_openalex_2024_02.institutions institution:string
bq mk --table insyspo:publicdb_openalex_2024_02.publishers publisher:string
bq mk --table insyspo:publicdb_openalex_2024_02.funders funder:string
bq mk --table insyspo:publicdb_openalex_2024_02.concepts concept:string
bq mk --table insyspo:publicdb_openalex_2024_02.merged_ids merged_id:string


for data_file in openalex-snapshot/data/works/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'work:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.works $data_file;
done

for data_file in openalex-snapshot/data/authors/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'author:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.authors $data_file;
done

for data_file in openalex-snapshot/data/sources/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'source:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.sources $data_file;
done

for data_file in openalex-snapshot/data/institutions/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'institution:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.institutions $data_file;
done

for data_file in openalex-snapshot/data/publishers/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'publisher:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.publishers $data_file;
done

for data_file in openalex-snapshot/data/funders/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'funder:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.funders $data_file;
done

for data_file in openalex-snapshot/data/concepts/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'concept:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.concepts $data_file;
done

for data_file in openalex-snapshot/data/merged_ids/*/*.gz;
do
    bq load --source_format=CSV -F '\t' \
        --schema 'merged_id:string' \
        --project_id insyspo \
        publicdb_openalex_2024_02.merged_ids $data_file;
done