namespace HTMLHelperAnnotationApp.Migrations {
    using System.Data.Entity.Migrations;

    public partial class version1 : DbMigration {
        public override void Up() {
            CreateTable(
                "dbo.Employees",
                c => new {
                    Id = c.Int(nullable: false, identity: true),
                    Name = c.String(nullable: false, maxLength: 20),
                    Email = c.String(nullable: false),
                    Gender = c.String(nullable: false),
                    Address = c.String(nullable: false, maxLength: 200),
                    Depratment = c.String(nullable: false),
                    Password = c.String(nullable: false),
                    ConfirmPassword = c.String(nullable: false),
                })
                .PrimaryKey(t => t.Id);

        }

        public override void Down() {
            DropTable("dbo.Employees");
        }
    }
}
