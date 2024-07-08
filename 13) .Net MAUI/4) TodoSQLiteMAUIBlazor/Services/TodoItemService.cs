
using SQLite;
using TodoSQLiteMaui.Models;

namespace TodoSQLiteMaui.Services;

public class TodoItemService
{
    SQLiteAsyncConnection ConexionBD;
    public const string DatabaseFilename = "ListaTareasSQLite.db3";

    public const SQLite.SQLiteOpenFlags BanderasPermisos =
        SQLite.SQLiteOpenFlags.ReadWrite |
        SQLite.SQLiteOpenFlags.Create |
        SQLite.SQLiteOpenFlags.SharedCache;

    public static string DatabasePath =>
        Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), 
            DatabaseFilename); 

    public TodoItemService()
    {
        ConectaConBD();
    }

    private async Task ConectaConBD()
    {

        if (ConexionBD == null)
        {
            ConexionBD = new SQLiteAsyncConnection(DatabasePath, BanderasPermisos);
            await ConexionBD.CreateTableAsync<TodoItem>();
        }
    }

    public async Task<List<TodoItem>> ConsultaTodasLasTareas()
    {
        return await ConexionBD.Table<TodoItem>().ToListAsync();
    }

    public async Task<TodoItem> ConsultaUnaTarea(int id)
    {
        return await ConexionBD.Table<TodoItem>().Where(i => i.ID == id).FirstOrDefaultAsync();
    }

    public async Task<List<TodoItem>> ConsultaTareasPendientes()
    {
        return await ConexionBD.Table<TodoItem>().Where(t => t.IsDone).ToListAsync();
    }

    public async Task<int> GuardarTareaEnBD(TodoItem item)
    {
        if (item.ID != 0)
        {
            return await ConexionBD.UpdateAsync(item);
        }
        else
        {
            return await ConexionBD.InsertAsync(item);
        }
    }

    public async Task<int> BorraTareaBD(TodoItem item)
    {
        return await ConexionBD.DeleteAsync(item);
    }
}