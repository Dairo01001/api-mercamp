import { ApiProperty } from '@nestjs/swagger';

export class AuthEntity {
  @ApiProperty()
  id: string;

  @ApiProperty()
  name: string;

  @ApiProperty()
  email: string;

  @ApiProperty()
  token: string;
}
