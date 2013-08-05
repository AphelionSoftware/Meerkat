namespace LightSwitchApplication
{
    public partial class DataVersion
    {
        partial void DataVersion_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
        }
    }
}
