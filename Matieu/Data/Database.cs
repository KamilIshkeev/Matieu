using Npgsql;

namespace Matieu
{
    public static class Database
    {
        private static readonly string connectionString = "Host=localhost;Port=5432;Database=matieu;Username=postgres;Password=1108";

        public static NpgsqlConnection GetConnection()
        {
            return new NpgsqlConnection(connectionString);
        }
    }
}
