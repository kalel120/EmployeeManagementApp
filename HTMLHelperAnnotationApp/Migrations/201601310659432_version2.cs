namespace HTMLHelperAnnotationApp.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class version2 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Employees", "ConfirmPassword");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Employees", "ConfirmPassword", c => c.String(nullable: false));
        }
    }
}
