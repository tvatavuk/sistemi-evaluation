using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace SistemiEvaluation.Migrations
{
    public partial class ContentChange : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "GmapLat",
                table: "Content");

            migrationBuilder.DropColumn(
                name: "GmapLng",
                table: "Content");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "GmapLat",
                table: "Content",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "GmapLng",
                table: "Content",
                nullable: false,
                defaultValue: "");
        }
    }
}
