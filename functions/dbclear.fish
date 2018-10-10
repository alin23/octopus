function dbclear
    set user "$argv[1]"
    set db "$argv[2]"
    psql --no-psqlrc -U "$user" "$db" -t -c "select 'drop table \"' || tablename || '\" cascade;' from pg_tables where schemaname = 'public'"    | psql --no-psqlrc -U "$user" "$db"
end
