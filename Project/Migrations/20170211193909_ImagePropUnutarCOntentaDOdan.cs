using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace SistemiEvaluation.Migrations
{
    public partial class ImagePropUnutarCOntentaDOdan : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Content",
                nullable: true,
                oldClrType: typeof(string));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Image",
                table: "Content",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);
        }
    }
}
